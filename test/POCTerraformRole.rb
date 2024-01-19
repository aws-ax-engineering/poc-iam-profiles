require 'awspec'

describe iam_role('POCTerraformRole') do
  it { should exist }
  it { should have_iam_policy('POCTerraformRolePolicys') }
end
