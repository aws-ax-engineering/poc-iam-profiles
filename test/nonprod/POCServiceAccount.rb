require 'awspec'

describe iam_group('POCServiceAccountGroup') do
  it { should exist }
end

describe iam_group('POCServiceAccountGroup') do
  it { should have_iam_user('POCServiceAccount') }
end