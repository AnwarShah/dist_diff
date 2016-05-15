require 'spec_helper'
require 'dist_diff'

RSpec.describe DistDiff do
  describe "#initialize" do
    it "accepts two filenames as two arguments" do
      expect{ DistDiff.new() }.to raise_error(ArgumentError)
      expect{ DistDiff.new('file1', 'file2') }.not_to raise_error
    end
  end

  describe "#extra_packages" do

    let(:ubuntu_manifest_content) {
<<-END
account-plugin-aim  3.12.10-0ubuntu2
acpid 1:2.0.23-1ubuntu1
alsa-base 1.0.25+dfsg-0ubuntu5
alsa-utils  1.0.29-0ubuntu1
activity-log-manager  0.9.7-0ubuntu22
brasero-common  3.12.1-0ubuntu2
bsdmainutils  9.0.6ubuntu1
cheese-common 3.16.1-1ubuntu2
END
    }

    let(:kubuntu_manifest_content) {
<<-END
adduser 3.113+nmu3ubuntu4
adwaita-icon-theme  3.16.2.1-2ubuntu1
akonadi-server  4:15.08.2-0ubuntu1
akregator 4:15.08.2-0ubuntu1
alsa-base 1.0.25+dfsg-0ubuntu5
alsa-utils  1.0.29-0ubuntu1
amarok  2:2.8.0-0ubuntu6
END
}

    let(:ubuntu_manifest_file) { StringIO.new }
    let(:kubuntu_manifest_file) { StringIO.new }

    before(:example) do
      # Setting the content
      ubuntu_manifest_file.string = ubuntu_manifest_content
      kubuntu_manifest_file.string = kubuntu_manifest_content

      allow(File).to receive(:open).with('ubuntu_manifest', 'r').and_yield(ubuntu_manifest_file)
      allow(File).to receive(:open).with('kubuntu_manifest', 'r').and_yield(kubuntu_manifest_file)
    end

    subject { DistDiff.new('ubuntu_manifest', 'kubuntu_manifest') }

    it "returns an array" do
      expect(subject.extra_packages).to be_kind_of(Array)
    end

    it "returns the package names only presents in the second manifest" do
      returned_result = subject.extra_packages
      expect(returned_result).to eq ['adduser', 'adwaita-icon-theme', 'akonadi-server', 'akregator', 'amarok']
    end
  end
end