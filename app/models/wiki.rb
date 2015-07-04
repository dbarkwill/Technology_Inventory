class Wiki < ActiveRecord::Base
  before_create :generate_page_reference
  before_save :transform_links
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user
  scope :is_root,-> {where(root: true)}

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end

  def self.tag_counts
    tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  private
    def generate_page_reference(length=8)
      write_attribute(:page_reference, rand(36**length).to_s(36))
    end

    def transform_links
      match = Regexp.new(/\[{2}([\w\s]{1,})\]{2}/i)
      contents.to_s.gsub!(match) do |substitute|
        result = Wiki.find_or_create_by(:page_name => $1)
        '<a href="/wiki/' + result.page_reference + '">' + $1 + '</a>'
      end
    end

end
