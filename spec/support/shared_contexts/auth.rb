shared_context "authentication", auth: :user do
  let!(:user) { create :user }
end
