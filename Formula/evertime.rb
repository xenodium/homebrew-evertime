class Evertime < Formula
  desc "An ever present clock for macOS"
  homepage "https://github.com/xenodium/EverTime"
  head "https://github.com/xenodium/EverTime.git", branch: "main"
  license "MIT"

  depends_on xcode: :build

  def install
    system "xcodebuild", "-scheme", "EverTime", "-configuration", "Release", "CODE_SIGN_IDENTITY=", "CODE_SIGNING_REQUIRED=NO", "CODE_SIGNING_ALLOWED=NO", "SYMROOT=build"
    prefix.install "build/Release/EverTime.app"
  end

  def caveats
    <<~EOS
      EverTime.app was installed to:
        #{opt_prefix}/EverTime.app

      To launch from Terminal:
        open "#{opt_prefix}/EverTime.app"
    EOS
  end

  test do
    assert_predicate prefix/"EverTime.app", :exist?
  end
end
