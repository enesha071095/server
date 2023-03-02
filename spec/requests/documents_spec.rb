RSpec.describe Api::V1::DocumentsController, type: :controller do

  describe "GET #index" do
    context "when user_id is provided" do
      let(:user) { FactoryBot.create(:user) }
      let(:document1) { FactoryBot.create(:document, user_id: user.id) }
      let(:document2) { FactoryBot.create(:document, user_id: user.id) }

      it "returns a success response" do
        get :index, params: { user_id: user.id }
        expect(response).to be_successful
      end

      it "returns documents belonging to the user" do
        get :index, params: { user_id: user.id }
        expect(assigns(:data)).to match_array(DocumentSerializer.new([document1, document2]).serializable_hash)
      end
    end

    context "when user_id is not provided" do
      let(:document1) { FactoryBot.create(:document) }
      let(:document2) { FactoryBot.create(:document) }

      it "returns a success response" do
        get :index
        expect(response).to be_successful
      end

      it "returns all documents" do
        get :index
        expect(assigns(:data)).to match_array(DocumentSerializer.new([document1, document2]).serializable_hash)
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:document_params) { FactoryBot.attributes_for(:document) }

      it "creates a new document" do
        expect {
          post :create, params: document_params
        }.to change(Document, :count).by(1)
      end

      it "returns a success response" do
        post :create, params: document_params
        expect(response).to be_successful
      end

      it "returns the created document" do
        post :create, params: document_params
        expect(assigns(:data)).to eq(DocumentSerializer.new(Document.last).serializable_hash)
      end
    end

    context "with invalid params" do
      let(:invalid_document_params) { FactoryBot.attributes_for(:document, name: nil) }

      it "does not create a new document" do
        expect {
          post :create, params: invalid_document_params
        }.not_to change(Document, :count)
      end

      it "returns an error response" do
        post :create, params: invalid_document_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    let(:document) { FactoryBot.create(:document) }

    context "with valid params" do
      it "updates the document status" do
        put :update, params: { id: document.id, status: 1 }
        expect(document.reload.status).to eq(1)
      end

      it "returns a success response" do
        put :update, params: { id: document.id, status: 1 }
        expect(response).to be_successful
      end
    end

    context "with invalid params" do
      it "returns an error response" do
        put :update, params: { id: document.id, status: "invalid_status" }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:document) { FactoryBot.create(:document) }
  end
end
