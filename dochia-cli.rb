# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DochiaCli < Formula
  desc "Dochia automatically generates and executes negative and boundary testing so you can focus on creative problem-solving."
  homepage "https://dochia.dev"

  if OS.mac?
      if Hardware::CPU.intel?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.0.0/dochia-cli_macos_amd64_2.0.0.tar.gz"
        sha256 "7e550fad6cbfac80eb075588f80895f6c190c7cd0b79ad3d7612bbded7c9b81e"
      elsif Hardware::CPU.arm?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.0.0/dochia-cli_macos_arm64_2.0.0.tar.gz"
        sha256 "262ab0ce5362235881ed17d6f2ce24bcdfbb047d1830b87938440f38f20647bd"
      end
  elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.0.0/dochia-cli_linux_amd64_2.0.0.tar.gz"
        sha256 "cbc53eab86e1524036ee27012fc84e20dd32c4d31580e977409b1f656696c90b"
      elsif Hardware::CPU.arm?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.0.0/dochia-cli_linux_arm64_2.0.0.tar.gz"
        sha256 "729261d1b0e372f489b3250941ceb171165e5d389af3161369311ef37d47d01a"
      end
  else
    odie "Please use the uberjar version: https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-2.0.0/dochia-cli_uberjar_2.0.0.tar.gz"
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
