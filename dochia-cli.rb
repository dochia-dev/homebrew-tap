# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DochiaCli < Formula
  desc "Dochia automatically generates and executes negative and boundary testing so you can focus on creative problem-solving."
  homepage "https://dochia.dev"

  if OS.mac?
      if Hardware::CPU.intel?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-1.0.5/dochia-cli_macos_amd64_1.0.5.tar.gz"
        sha256 "678e55761b0a6b7b16cf91830c9bed5ec82ee159272f6b9b249d96a78bd48e30"
      elsif Hardware::CPU.arm?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-1.0.5/dochia-cli_macos_arm64_1.0.5.tar.gz"
        sha256 "1b9ee05ba457cfc0abcb0f6d5817cc0ac705c134ec1735df788c5354224c06c6"
      end
  elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-1.0.5/dochia-cli_linux_amd64_1.0.5.tar.gz"
        sha256 "d6e9e98cb84282d0da490d3ccc134419c96bd02da07e62baa9eb53128daaca34"
      elsif Hardware::CPU.arm?
        url "https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-1.0.5/dochia-cli_linux_arm64_1.0.5.tar.gz"
        sha256 "5804a775d7fd46ec191697603be1909f6596ac3febd6341b43e23a5215b1f013"
      end
  else
    odie "Please use the uberjar version: https://github.com/dochia-dev/dochia-cli/releases/download/dochia-cli-1.0.5/dochia-cli_uberjar_1.0.5.tar.gz"
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
