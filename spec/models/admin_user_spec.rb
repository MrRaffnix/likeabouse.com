require 'spec_helper'

describe AdminUser do
  subject { create(:admin_user) }

  it { should have_many(:posts) }
end