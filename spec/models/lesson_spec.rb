require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let(:company) { FactoryGirl.create :company }
  let!(:lesson) { FactoryGirl.create :lesson, title: "foobar", company: company }

  before do
    Lesson.reindex
  end

  it "works without the fields parameter" do
    result = Lesson.search('foobar')

    expect(result.first).to eq lesson
  end

  it "works with fields parameter" do
    result = Lesson.search('foobar', fields: [:title])

    expect(result.first).to eq lesson
  end
end
