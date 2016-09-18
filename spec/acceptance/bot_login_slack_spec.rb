require_relative "../spec_helper"

describe "Bot should connect on slack channel" do
  it "Prints hello message, that means that it has connected to slack!" do
    expect { GoHiring.run }.to output(/Successfully connected, welcome/).to_stdout_from_any_process
  end
end
