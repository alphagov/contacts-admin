require 'rails_helper'
require 'gds_api/test_helpers/content_store'
require 'gds_api/test_helpers/publishing_api'

describe Publisher do
  let(:contact) { build :contact, :with_related_contacts, title: 'Chief Milliners Office' }

  context '#publish' do
    context 'with links' do
      let(:presenter) { ContactPresenter.new(contact) }

      it 'calls put_content' do
        expect(Publisher.client).to receive(:put_content)
          .with(contact.content_id, presenter.payload)
          .and_call_original

        Publisher.new(presenter).publish
      end

      it 'calls patch_links' do
        expect(Publisher.client).to receive(:patch_links)
          .with(contact.content_id, presenter.links)
          .and_call_original

        Publisher.new(presenter).publish
      end

      it 'calls publish' do
        expect(Publisher.client).to receive(:publish)
          .with(contact.content_id,
                nil,
                locale: presenter.payload[:locale])

        Publisher.new(presenter).publish
      end

      it 'returns a succesful response' do
        response = Publisher.new(presenter).publish

        expect(response).to be_truthy
      end
    end

    context 'when communicating with publishing api fails' do
      let(:presenter) { ContactPresenter.new(contact) }

      context 'with unsuccessful put_content to draft' do
        before { stub_any_publishing_api_put_content.to_return(status: 422, body: "Failed put content") }

        it "returns false and logs an error in Errbit" do
          expect(GovukError).to receive(:notify)
          response = Publisher.new(presenter).publish

          expect(response).to be_falsey
        end
      end

      context 'with unsuccessful patch_links' do
        before { stub_any_publishing_api_patch_links.to_return(status: 422, body: "Failed put links") }

        it "returns false and logs an error in Errbit" do
          expect(GovukError).to receive(:notify)
          response = Publisher.new(presenter).publish

          expect(response).to be_falsey
        end
      end

      context 'with unsuccessful publish' do
        before { stub_any_publishing_api_call.to_return(status: 422, body: "Failed publish") }

        it "returns false and logs an error in Errbit" do
          expect(GovukError).to receive(:notify)
          response = Publisher.new(presenter).publish

          expect(response).to be_falsey
        end
      end
    end
  end
end
