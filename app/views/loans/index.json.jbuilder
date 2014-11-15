json.array!(@loans) do |loan|
  json.extract! loan, :id, :loanee, :notes
  json.url loan_url(loan, format: :json)
end
