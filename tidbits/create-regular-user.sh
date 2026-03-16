#!/bin/bash

set -e

# Generate random username like Docker containers if not provided
generate_random_username() {
    # Docker-style: larger word lists for more combinations
    adjectives=("admiring" "adoring" "affectionate" "agitated" "amazing" "angry" "awesome" "beautiful" "blissful" "bold" "boring" "brave" "busy" "charming" "clever" "cool" "compassionate" "competent" "condescending" "confident" "cranky" "crazy" "dazzling" "determined" "distracted" "dreamy" "eager" "ecstatic" "elastic" "elated" "elegant" "eloquent" "epic" "exciting" "fervent" "festive" "flamboyant" "focused" "friendly" "frosty" "funny" "gallant" "gifted" "goofy" "gracious" "great" "happy" "hardcore" "heuristic" "hopeful" "hungry" "infallible" "inspiring" "interesting" "intelligent" "jolly" "jovial" "keen" "kind" "laughing" "loving" "lucid" "magical" "mystifying" "modest" "musing" "naughty" "nervous" "nice" "nifty" "nostalgic" "objective" "optimistic" "peaceful" "pedantic" "pensive" "practical" "priceless" "quirky" "quizzical" "recursing" "relaxed" "reverent" "romantic" "sad" "serene" "sharp" "silly" "sleepy" "stoic" "strange" "stupefied" "suspicious" "sweet" "tender" "thirsty" "trusting" "unruffled" "upbeat" "vibrant" "vigilant" "vigorous" "wizardly" "wonderful" "xenodochial" "youthful" "zealous" "zen")

    scientists=("albattani" "allen" "almeida" "antonelli" "agnesi" "archimedes" "ardinghelli" "aryabhata" "austin" "babbage" "banach" "banzai" "bardeen" "bartik" "bassi" "beaver" "bell" "benz" "bhabha" "bhaskara" "black" "blackburn" "blackwell" "bohr" "booth" "borg" "bose" "bouman" "boyd" "brahmagupta" "brattain" "brown" "buck" "burnell" "cantor" "carson" "cartwright" "carver" "cerf" "chandrasekhar" "chaplygin" "chatelet" "chatterjee" "chebyshev" "cohen" "chaum" "clarke" "colden" "cori" "cray" "curran" "curie" "darwin" "davinci" "dewdney" "dhawan" "diffie" "dijkstra" "dirac" "driscoll" "dubinsky" "easley" "edison" "einstein" "elbakyan" "elgamal" "elion" "ellis" "engelbart" "euclid" "euler" "evans" "faraday" "feistel" "fermat" "fermi" "feynman" "franklin" "gagarin" "galileo" "galois" "ganguly" "gates" "gauss" "germain" "goldberg" "goldstine" "goldwasser" "golick" "goodall" "gould" "greider" "grothendieck" "haibt" "hamilton" "haslett" "hawking" "hellman" "heisenberg" "hermann" "herschel" "hertz" "heyrovsky" "hodgkin" "hofstadter" "hoover" "hopper" "hugle" "hypatia" "jackson" "jang" "jemison" "jennings" "jepsen" "johnson" "joliot" "jones" "kalam" "kapitsa" "kare" "keldysh" "keller" "kepler" "khayyam" "khorana" "kilby" "kirch" "knuth" "kowalevski" "lalande" "lamarr" "lamport" "leakey" "leavitt" "lederberg" "lehmann" "lewin" "lichterman" "liskov" "lovelace" "lumiere" "mahavira" "margulis" "matsumoto" "maxwell" "mayer" "mccarthy" "mcclintock" "mclaren" "mclean" "mcnulty" "mendel" "mendeleev" "meitner" "meninsky" "merkle" "mestorf" "meyer" "mirzakhani" "moore" "morse" "murdock" "moser" "napier" "nash" "neumann" "newton" "nightingale" "nobel" "noether" "northcutt" "noyce" "panini" "pare" "pascal" "pasteur" "payne" "perlman" "pike" "poincare" "poitras" "proskuriakova" "ptolemy" "raman" "ramanujan" "ride" "montalcini" "ritchie" "rhodes" "robinson" "roentgen" "rosalind" "rubin" "saha" "sammet" "sanderson" "shannon" "shaw" "shirley" "shockley" "shtern" "sinoussi" "snyder" "solomon" "spence" "stallman" "stonebraker" "sutherland" "swanson" "swartz" "swirles" "taussig" "tesla" "tharp" "thompson" "torvalds" "tu" "turing" "varahamihira" "vaughan" "visvesvaraya" "volhard" "villani" "wescoff" "wilbur" "wiles" "williams" "williamson" "wilson" "wing" "wozniak" "wright" "wu" "yalow" "yonath" "zhukovsky")

    local attempt=0
    local max_attempts=10

    while [ $attempt -lt $max_attempts ]; do
        adj=${adjectives[$RANDOM % ${#adjectives[@]}]}
        scientist=${scientists[$RANDOM % ${#scientists[@]}]}
        candidate="${adj}_${scientist}"

        # Check if username already exists
        if ! id "$candidate" &>/dev/null; then
            echo "$candidate"
            return
        fi

        ((attempt++))
    done

    # Fallback: add timestamp if all attempts failed
    adj=${adjectives[$RANDOM % ${#adjectives[@]}]}
    scientist=${scientists[$RANDOM % ${#scientists[@]}]}
    echo "${adj}_${scientist}_$(date +%s | tail -c 4)"
}

username=${1:-$(generate_random_username)}
filename=${username/\./""}
filename=${filename/_/""}  # Remove underscores for filename
filename=${filename/-/""}  # Remove hyphens for filename
publickey=${2:-"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHbWEZygV6f+MENAwwP24NwGGMOqKC0XkH6DjEE7PVSA zhenhua.lei@GUI"}
base_dir=$([ -d "/mnt/disk/sub/home" ] && echo /mnt/disk/sub/home || echo /home)

# Function to find first available UID starting from 61919
find_available_uid() {
    local uid=61919
    while id -u $uid >/dev/null 2>&1; do
        ((uid++))
    done
    echo $uid
}

# Final check for username collision (in case user provided existing name)
if id "$username" &>/dev/null; then
    echo "Error: User $username already exists!"
    exit 1
fi

# Find available UID/GID
target_uid=$(find_available_uid)

echo "Creating regular user:"
echo "Username: $username"
echo "UID/GID: $target_uid"

# Detect if we have Debian-style adduser or useradd-style adduser
if adduser --help 2>&1 | grep -q "disabled-password"; then
    # Debian/Ubuntu style adduser - has automatic subuid/subgid allocation
    echo "Using Debian-style adduser..."
    sudo adduser --disabled-password --gecos "" --uid $target_uid --home ${base_dir}/$username $username
else
    # RHEL/CentOS/AliyunOS style - use useradd and manual subuid/subgid
    echo "Using RHEL-style useradd..."

    # Create group first (to ensure GID matches UID)
    sudo groupadd -g $target_uid $username

    # Use useradd
    sudo useradd -m -s /bin/bash -u $target_uid -g $target_uid -d ${base_dir}/$username $username

    # Manually handle subuid/subgid allocation
    # Find next available subuid range by checking existing allocations
    next_subuid=100000
    if [ -f /etc/subuid ] && [ -s /etc/subuid ]; then
        # Get the maximum end value of existing ranges
        max_end_subuid=$(awk -F: '{print $2 + $3}' /etc/subuid | sort -n | tail -1)
        if [ "$max_end_subuid" -gt "$next_subuid" ]; then
            next_subuid=$max_end_subuid
        fi
    fi

    # Find next available subgid range by checking existing allocations
    next_subgid=100000
    if [ -f /etc/subgid ] && [ -s /etc/subgid ]; then
        # Get the maximum end value of existing ranges
        max_end_subgid=$(awk -F: '{print $2 + $3}' /etc/subgid | sort -n | tail -1)
        if [ "$max_end_subgid" -gt "$next_subgid" ]; then
            next_subgid=$max_end_subgid
        fi
    fi

    # Add subuid/subgid entries (65536 is the standard range size)
    echo "$username:$next_subuid:65536" | sudo tee -a /etc/subuid
    echo "$username:$next_subgid:65536" | sudo tee -a /etc/subgid

    echo "Manually allocated subuid: $username:$next_subuid:65536"
    echo "Manually allocated subgid: $username:$next_subgid:65536"
fi

# Create minimal sudoers file - only for password change
echo "# Minimal sudo privileges for regular user $username" | sudo tee /etc/sudoers.d/$filename
echo "$username ALL=(ALL) /usr/bin/passwd $username" | sudo tee -a /etc/sudoers.d/$filename
echo "Defaults:$username timestamp_timeout=5" | sudo tee -a /etc/sudoers.d/$filename

user_home=${base_dir}/$username
user_ssh_directory=$user_home/.ssh
user_file_auth_key=$user_ssh_directory/authorized_keys

# Setup SSH directory and keys
sudo mkdir -p $user_ssh_directory
sudo chown -hR $username:$username ${user_home}
sudo touch $user_ssh_directory/authorized_keys

echo $publickey | sudo tee $user_file_auth_key

# Set proper ownership and permissions
sudo chown -hR $username:$username $user_file_auth_key
sudo chmod 700 ${user_home}
sudo chmod 700 $user_ssh_directory
sudo chmod 600 $user_file_auth_key

# Force password change on first login (like super-user script)
sudo chage -d 0 $username

echo ""
echo "✅ Regular user created successfully!"
echo "👤 Username: $username"
echo "🏠 Home directory: $user_home"
echo "🔑 SSH key authentication configured"
echo "🔒 Limited sudo: can only change own password via 'sudo passwd $username'"
echo "📦 subuid/subgid automatically allocated by adduser"
echo "⚠️  User will be prompted to set password on first login"
echo ""

# Show subuid/subgid allocation
echo "📋 User namespace allocation:"
if [ -f /etc/subuid ]; then
    grep "^$username:" /etc/subuid || echo "  subuid: (not found)"
fi
if [ -f /etc/subgid ]; then
    grep "^$username:" /etc/subgid || echo "  subgid: (not found)"
fi