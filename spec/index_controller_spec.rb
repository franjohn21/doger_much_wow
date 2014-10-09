require "spec_helper"

describe "Index controller" do
  it "returns a response" do
      request("/").should be_ok
  end

  it "requests the URI using GET by default" do
    request "/"
    last_request.should be_get
    last_response.should be_ok
  end

  it "defaults to port 80" do
    request "/"
    last_request.env["SERVER_PORT"].should == "80"
  end

  it "yields the response to a given block" do
    request "/" do |response|
      response.should be_ok
    end
  end

  it "supports sending :params" do
    request "/", :params => { "foo" => "bar" }
    last_request.GET["foo"].should == "bar"
  end
end
