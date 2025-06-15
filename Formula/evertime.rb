class EverTime < Formula
  desc "An ever present clock for macOS"
  homepage "https://github.com/xenodium/EverTime"
  head "https://github.com/xenodium/EverTime.git", branch: "main"
  license "MIT"

  depends_on xcode: :build

  def install
    system "xcodebuild", "-scheme", "EverTime", "-configuration", "Release", "SYMROOT=build"
    prefix.install "build/Release/EverTime.app"
  end

  test do
    assert_predicate prefix/"EverTime.app", :exist?
  end
end
