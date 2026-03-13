# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DochiaCli < Formula
  desc "Dochia automatically generates and executes negative and boundary testing so you can focus on creative problem-solving."
  homepage "https://dochia.dev"

  if OS.mac?
      if Hardware::CPU.intel?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-1.3.0/dochia-cli_macos_amd64_1.3.0.tar.gz"
        sha256 "50fb0cc1c86214429c4b30e9f856326966a5e82fb46966e97be326d708981b7a"
      elsif Hardware::CPU.arm?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-1.3.0/dochia-cli_macos_arm64_1.3.0.tar.gz"
        sha256 "4316adba78a2e3b6e8aa25077e657b1a3cd4735c1996de5f4c89c8c5b4ef52e2"
      end
  elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-1.3.0/dochia-cli_linux_amd64_1.3.0.tar.gz"
        sha256 "6f4dfb2a00c8ce53bd11ef5217f77581f80c7c4cf44c52e395ad46ffd39c9714"
      elsif Hardware::CPU.arm?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-1.3.0/dochia-cli_linux_arm64_1.3.0.tar.gz"
        sha256 "c847611599f95a7447519940390324c810077fdf590e8329251711495b93a3c1"
      end
  else
    odie "Please use the uberjar version: https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-1.3.0/dochia-cli_uberjar_1.3.0.tar.gz"
  end

  license "Apache-2.0"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install 'dochia'
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test sol`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
