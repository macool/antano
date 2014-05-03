require "spec_helper"

describe "photos" do
  include CuxibambaBuilder

  let!(:photo) { create :photo, :published }
  let(:photo_selector) { "a[href='#{photo_path(photo)}']" }

  before {
    create_cuxibamba!
    visit root_path
  }

  it "should have cuxibamba's profile" do
    expect(page).to have_content "Valle de Cuxibamba"
  end

  it "should have link to image" do
    expect(page).to have_selector photo_selector
  end

  describe "show" do
    before {
      find(photo_selector).click
    }

    it { expect(current_path).to eq(photo_path(photo)) }
    it { expect(page).to have_content(photo.title) }
    it { expect(page).to have_content(photo.description) }
  end
end
