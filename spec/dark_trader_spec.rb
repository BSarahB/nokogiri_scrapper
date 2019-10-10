require_relative "../lib/dark_trader"

describe "the crypto_scrapper method" do
  it "should return a my_hash not nil" do
    expect(crypto_scrapper).not_to be_nil
  end
end