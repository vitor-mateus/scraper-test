require "../scraper-test/lib/models/scraper"

describe Scraper do

  it "should print data" do
    scraper = Scraper.new
    res = scraper.print_values
    expect(res).to be true
  end

end
