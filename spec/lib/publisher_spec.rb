require 'spec_helper'
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

      it 'calls put_links' do
        Publisher.client.should_receive(:put_links)
          .with(contact.content_id, presenter.links)
          .and_call_original

        Publisher.new(presenter).publish
      end

      it 'calls publish' do
        Publisher.client.should_receive(:publish)
          .with(contact.content_id,
              update_type: presenter.payload[:update_type],
              locale: presenter.payload[:locale])

        Publisher.new(presenter).publish
      end

      it 'returns a succesful response' do
        response = Publisher.new(presenter).publish

        expect(response).to be_true
      end
    end

    context 'with no links' do
      let(:gone_presenter) { ContactGonePresenter.new(contact) }

      it 'does not call put_links' do
        Publisher.client.should_not_receive(:put_links)

        Publisher.new(gone_presenter).publish
      end
    end

    context 'when communicating with publishing api fails' do
      let(:presenter) { ContactPresenter.new(contact) }

      context 'with unsuccessful put_content to draft' do
        before { stub_any_publishing_api_put_content.to_return(status: 422, body: "Failed put content") }

        it "returns false" do
          response = Publisher.new(presenter).publish

          expect(response).to be_false
        end
      end

      context 'with unsuccessful put_links' do
        before { stub_any_publishing_api_put_links.to_return(status: 422, body: "Failed put links") }

        it "returns false" do
          response = Publisher.new(presenter).publish

          expect(response).to be_false
        end
      end

      context 'with unsuccessful publish' do
        before { stub_any_publishing_api_call.to_return(status: 422, body: "Failed publish") }

        it "returns false" do
          response = Publisher.new(presenter).publish

          expect(response).to be_false
        end
      end
    end
  end
end
