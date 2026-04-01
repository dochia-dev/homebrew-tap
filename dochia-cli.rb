# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DochiaCli < Formula
  desc "Dochia automatically generates and executes negative and boundary testing so you can focus on creative problem-solving."
  homepage "https://dochia.dev"

  if OS.mac?
      if Hardware::CPU.intel?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.1.1/dochia-cli_macos_amd64_2.1.1.tar.gz"
        sha256 "dff96dfa0ced85283586533a912e95a3affcd76b736c224d629bb22336d64843"
      elsif Hardware::CPU.arm?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.1.1/dochia-cli_macos_arm64_2.1.1.tar.gz"
        sha256 "a921530c303a1019e25e8be862715540148b0b19b227f727c13413037af47924"
      end
  elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.1.1/dochia-cli_linux_amd64_2.1.1.tar.gz"
        sha256 "76d4d0ce2bf4d4e62584a99abbfbf68ba135a90121eef9bc53b07a3e6b6b2f73"
      elsif Hardware::CPU.arm?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.1.1/dochia-cli_linux_arm64_2.1.1.tar.gz"
        sha256 "a63331cc2bf876ed66e0dcb4bcc1bc7ad3821bd2ae8d302ef83ae40c4383fa56"
      end
  else
    odie "Please use the uberjar version: https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.1.1/dochia-cli_uberjar_2.1.1.tar.gz"
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
