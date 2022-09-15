# frozen_string_literal: true

shared_examples "Admin or User can/can't to do" do
  it 'Admin can to do' do
    expect(subject).to permit(admin)
  end

  it "User can't to do" do
    expect(subject).not_to permit(user)
  end
end
