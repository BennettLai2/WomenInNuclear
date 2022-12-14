require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/meetinglogs", type: :request do
  # Meetinglog. As you add validations to Meetinglog, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  describe "GET /index" do
    it "renders a successful response" do
      Meetinglog.create! valid_attributes
      get meetinglogs_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      meetinglog = Meetinglog.create! valid_attributes
      get meetinglog_url(meetinglog)
      expect(response).to be_successful
    end
  end

  # describe "GET /new" do
  #   it "renders a successful response" do
  #     get new_meetinglog_url
  #     expect(response).to be_successful
  #   end
  # end

  describe "GET /edit" do
    it "render a successful response" do
      meetinglog = Meetinglog.create! valid_attributes
      get edit_meetinglog_url(meetinglog)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Meetinglog" do
        expect do
          post meetinglogs_url, params: { meetinglog: valid_attributes }
        end.to change(Meetinglog, :count).by(1)
      end

      it "redirects to the created meetinglog" do
        post meetinglogs_url, params: { meetinglog: valid_attributes }
        expect(response).to redirect_to(meetinglog_url(Meetinglog.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Meetinglog" do
        expect do
          post meetinglogs_url, params: { meetinglog: invalid_attributes }
        end.to change(Meetinglog, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post meetinglogs_url, params: { meetinglog: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested meetinglog" do
        meetinglog = Meetinglog.create! valid_attributes
        patch meetinglog_url(meetinglog), params: { meetinglog: new_attributes }
        meetinglog.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the meetinglog" do
        meetinglog = Meetinglog.create! valid_attributes
        patch meetinglog_url(meetinglog), params: { meetinglog: new_attributes }
        meetinglog.reload
        expect(response).to redirect_to(meetinglog_url(meetinglog))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        meetinglog = Meetinglog.create! valid_attributes
        patch meetinglog_url(meetinglog), params: { meetinglog: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested meetinglog" do
      meetinglog = Meetinglog.create! valid_attributes
      expect do
        delete meetinglog_url(meetinglog)
      end.to change(Meetinglog, :count).by(-1)
    end

    it "redirects to the meetinglogs list" do
      meetinglog = Meetinglog.create! valid_attributes
      delete meetinglog_url(meetinglog)
      expect(response).to redirect_to(meetinglogs_url)
    end
  end
end
