class Wiki < ActiveRecord::Base
  before_create :generate_page_reference
  before_save :transform_links

  def generate_page_reference(length=8)
    write_attribute(:page_reference, rand(36**length).to_s(36))
  end

  def transform_links
    match = Regexp.new(/\[{2}([\w\s]{1,})\]{2}/i)
    contents.to_s.gsub!(match) do |substitute|
      result = Wiki.find_or_create_by(:page_name => substitute)
      '<a href="/wiki/' + result.page_reference + '">' + substitute + '</a>'
    end
  end

end
