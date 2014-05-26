require 'spec_helper'

describe User do
  describe User::Managementable do
    context "not manager" do
      let(:user) { build :user, :with_profile }
      it { expect(user).to_not be_manager }
    end
    context "manager" do
      let(:user) { build :user, :with_profile, :manager }
      it { expect(user).to be_manager }
    end
  end
end
