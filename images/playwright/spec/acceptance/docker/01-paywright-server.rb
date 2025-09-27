require 'spec_helper_docker'

require 'resolv'
require 'playwright'

context 'Playwright Server' do
  before :context do
    set :docker_container, 'playwright'
  end

  describe port(8080) do
    it { should be_listening }
  end

  it 'can open browsers' do
    ip_addr = command('hostname -i').stdout.chomp

    pw = Playwright.connect_to_playwright_server("ws://#{ip_addr}:8080/ws?browser=firefox")
    ff = pw.playwright.firefox.launch(headless: true)

    page = ff.new_page

    page.goto('https://icanhazip.com')
    content = page.query_selector('body pre').inner_html.chomp

    expect(content).to match(Regexp.union(Resolv::IPv4::Regex,Resolv::IPv6::Regex))
  end
end
