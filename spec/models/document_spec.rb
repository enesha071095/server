RSpec.describe Document, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:type) }
    it { should belong_to(:departament) }
    it { should belong_to(:currency) }
    it { should belong_to(:contract_type).optional }
    it { should have_one(:signature).optional }
  end

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:deadline) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:count) }
    it { should validate_inclusion_of(:status).in_array([true, false]) }
    it { should validate_associated(:user) }
  end

  describe "callbacks" do
    describe "before_create" do
      it "should assign contract_type_id to 1 if it is blank" do
        document = build(:document, contract_type_id: nil)
        document.save
        expect(document.contract_type_id).to eq(1)
      end
    end

    describe "after_create" do
      it "should create signature and attach a file to the document" do
        document = create(:document)
        expect(document.signature).to be_present
        expect(document.file).to be_attached
      end
    end
  end
end
