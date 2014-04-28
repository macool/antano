require "spec_helper"

describe "/" do
  it { expect(get: "/").to route_to(controller: "home", action: "index") }
end
