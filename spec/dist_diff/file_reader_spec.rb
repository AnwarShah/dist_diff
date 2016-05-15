require 'spec_helper'
require 'dist_diff/file_reader'

RSpec.describe FileReader do

  let(:file_content) {
<<-END
account-plugin-aim  3.12.10-0ubuntu2
acpid 1:2.0.23-1ubuntu1
amarok  2:2.8.0-0ubuntu6
END
    }
    let(:filename) { "ubuntu_manifest" }

    let(:manifest_file) { StringIO.new }

    before(:example) do
      allow(File).to receive(:open).with(filename,'r').and_yield(manifest_file)
      # Setting file content
      manifest_file.string = file_content
    end

    describe "#initialize" do
      it "accepts the filename as only argument" do
        expect { FileReader.new() }.to raise_error(ArgumentError)
      end
    end

    describe "#package_names" do
      it "returns an Array" do
        expect(FileReader.new(filename).package_names).to be_kind_of(Array)
      end

      it "returns the package names in the Array" do
        expect(FileReader.new(filename).package_names).to eq ['account-plugin-aim', 'acpid', 'amarok']
      end
    end
end