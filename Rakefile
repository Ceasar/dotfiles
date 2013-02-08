
files = Hash.new
files[:git]  = %w(.gitconfig)
files[:bash] = %w(.bash_profile .bashrc)
files[:misc] = %w(.configuration .rc.sh .tmux.conf)
files[:python]  = %w(.pythonrc.py)
files[:vim]  = %w(.vim .vimrc)
files[:zsh]  = %w(.zshrc .zsh_nocorrect)

$vim_bundles = {
    'coffeescript'       => 'kchmck/vim-coffee-script',
    'command-t'          => 'wincent/Command-T',
    'haskell'            => 'wlangstroth/vim-haskell',
    'markdown'           => 'tpope/vim-markdown',
    'pathogen'           => 'tpope/vim-pathogen',
    'python-pep8-indent' => 'hynek/vim-python-pep8-indent',
    'solarized'          => 'altercation/vim-colors-solarized',
    'syntastic'          => 'scrooloose/syntastic',
    'surround'           => 'tpope/vim-surround',
}

files_all = Array.new
[:zsh, :vim, :bash, :misc, :python, :git].each { |symbol| files_all << files[symbol] }
files_all.flatten!.sort!

task 'install:all' do
    files_all.each { |file| determine_action file }
    clone_omz
end

task 'install:bash' do
    files[:bash].each { |file| determine_action file }
end

task 'install:git' do
    files[:git].each { |file| determine_action file }
end

task 'install:python' do
    files[:python].each { |file| determine_action file }
end

task 'install:vim' do
    files[:vim].each { |file| determine_action file }
    vim_bundle_installer
end

task 'update:vim' do
    vim_bundle_updater
end

task 'install:zsh' do
    files[:zsh].each { |file| determine_action file }
    clone_omz
end

def print_help
    puts 'Usage: rake <task>'
    puts
    puts '    install:all   - Install all dotfiles'
    puts
    puts '    install:bash  - Install bash files'
    puts '    install:git   - Install git files'
    puts '    install:zsh   - Install zsh files'
    puts
    puts '    install:vim   - Install vim files and bundles'
    puts '    update:vim    - Update vim bundles'
end

task 'install:omz' do
    clone_omz
end

def determine_action(file)
    if File.exists? "#{ENV['HOME']}/#{file}"
        if $replace_all
            replace_file file
        else
            print "Overwrite ~/#{file}? [yNaq] "
            case STDIN.gets.chomp
            when 'a'
                $replace_all = true
                replace_file file
            when 'y'
                replace_file file
            when 'q'
                exit
            else
                puts "    skipping ~/#{file}"
            end
        end
    else
        link_file file
    end
end

def link_file(file)
    puts "    linking ~/#{file}"
    system "ln -s \"$PWD/#{file}\" \"$HOME/#{file}\""
end

def replace_file(file)
    puts "    removing old ~/#{file}"
    system "rm -f \"$HOME/#{file}\""
    link_file file
end

def clone_omz
    omz_path = "#{ENV['HOME']}/.oh-my-zsh"
    repo_url = 'https://github.com/robbyrussell/oh-my-zsh.git'
    if File.exists? omz_path
        puts '    ~/.oh-my-zsh already exists, skipping'
        puts 'To reinstall OMZ, rename or remove ~/.oh-my-zsh and try again.'
        return
    end
    system "git clone #{repo_url} #{omz_path}"
    system "cd #{omz_path} && git submodule update --init --recursive"
end

# install or update vim bundles
def vim_bundle_installer
    bundle_path = "#{ENV['HOME']}/.vim/bundle"
    unless File.exists? bundle_path
        mkdir bundle_path
    end
    $vim_bundles.each do |bundle, repo|
        this_bundle_path = "#{bundle_path}/#{bundle}"
        if File.exists? this_bundle_path
            if $vim_do_updates
                puts "    updating vim bundle #{bundle}"
                old_dir = Dir.pwd
                Dir.chdir this_bundle_path
                system 'git pull'
                Dir.chdir old_dir
            else
                puts "    skipping vim bundle #{bundle} (already exists)"
            end
        else
            puts "    cloning vim bundle #{bundle}"
            system "git clone https://github.com/#{repo}.git #{this_bundle_path}"
        end
    end
end

def vim_bundle_updater
    $vim_do_updates = true
    vim_bundle_installer
end

# clean out old vim bundles
def vim_bundle_cleanup
    bundle_path = "#{ENV['HOME']}/.vim/bundle"
    Dir["#{bundle_path}/*"].each do |d|
        unless $vim_bundles[File.basename d]
            puts "    cleaning up bundle #{File.basename d}"
            FileUtils.rm_rf d
        end
    end
end
