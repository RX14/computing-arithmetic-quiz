require "spec_helper"

RSpec.describe "ComputingArithmeticQuiz::App::TestHelper" do
    let(:helpers) { Class.new }
    before { helpers.extend ComputingArithmeticQuiz::App::TestHelper }
    subject { helpers }

    # pending "add some examples to (or delete) #{__FILE__}" do
    #    it "should return nil" do
    #        expect(subject.foo).to be_nil
    #    end
    # end
end
