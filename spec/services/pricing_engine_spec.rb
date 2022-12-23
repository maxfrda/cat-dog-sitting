require "rails_helper" 

RSpec.describe PricingEngine do
  describe "#determine_cost" do
    context "if the animal type is dog" do
      context "and 2 hours are requested" do
        it "returns 40" do
          pricing_engine = PricingEngine.new(animal_type: 'dog', hours_requested: 2)

          expect(pricing_engine.determine_cost).to eq(40)
        end
      end

      context "and 8 hours are requested" do
        it "returns 100" do
          pricing_engine = PricingEngine.new(animal_type: 'dog', hours_requested: 8)

          expect(pricing_engine.determine_cost).to eq(100)
        end
      end

      context "if the animal type is cat" do
        context "and 2 hours are requested" do
          it "returns 30" do
            pricing_engine = PricingEngine.new(animal_type: 'cat', hours_requested: 2)

            expect(pricing_engine.determine_cost).to eq(30)
          end
        end
  
        context "and 8 hours are requested" do
          it "returns 60" do
            pricing_engine = PricingEngine.new(animal_type: 'cat', hours_requested: 8)

            expect(pricing_engine.determine_cost).to eq(60)
          end
        end
      end

      context "if the animal type is not valid" do
        it "returns nil" do
          pricing_engine = PricingEngine.new(animal_type: 'rat', hours_requested: 2)

          expect(pricing_engine.determine_cost).to eq(nil)
        end
      end
    end
  end
end