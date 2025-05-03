// Vue configuration
Vue.config.productionTip = false;
Vue.config.devtools = false;

// Category table - Central management
const categories = {
    all: {
        id: 'all',
        name: 'All',
        icon: 'fa-stream',
        color: 'primary',
        bgClass: 'bg-primary-800/50',
        borderClass: 'border-primary-700/50',
        countBgClass: 'bg-primary-900/30',
        countTextClass: 'text-primary-300',
        filter: (event) => true
    },
    heist: {
        id: 'heist',
        name: 'Heist',
        icon: 'fa-bomb',
        color: 'red',
        bgClass: 'bg-red-900/70',
        borderClass: 'border-red-900/40',
        countBgClass: 'bg-red-900/30',
        countTextClass: 'text-red-300',
        headerGradient: 'bg-gradient-to-b from-red-900/40 to-dark-950',
        filter: (event) => event.title.includes('BANK') || event.title.includes('HEIST'),
        keywords: ['BANK', 'HEIST', 'ROBBERY']
    },
    police: {
        id: 'police',
        name: 'Police',
        icon: 'fa-shield-alt',
        color: 'blue',
        bgClass: 'bg-blue-900/70',
        borderClass: 'border-blue-900/40',
        countBgClass: 'bg-blue-900/30',
        countTextClass: 'text-blue-300',
        headerGradient: 'bg-gradient-to-b from-blue-900/40 to-dark-950',
        filter: (event) => event.title.includes('POLICE'),
        keywords: ['POLICE', 'COP', 'LAW']
    },
    racing: {
        id: 'racing',
        name: 'Racing',
        icon: 'fa-flag-checkered',
        color: 'yellow',
        bgClass: 'bg-yellow-900/70',
        borderClass: 'border-yellow-900/40',
        countBgClass: 'bg-yellow-900/30',
        countTextClass: 'text-yellow-300',
        headerGradient: 'bg-gradient-to-b from-yellow-900/40 to-dark-950',
        filter: (event) => event.title.includes('RACING'),
        keywords: ['RACING', 'RACE', 'CHAMPIONSHIP']
    },
    special: {
        id: 'special',
        name: 'Special',
        icon: 'fa-gem',
        color: 'purple',
        bgClass: 'bg-purple-900/70', 
        borderClass: 'border-purple-900/40',
        countBgClass: 'bg-purple-900/30',
        countTextClass: 'text-purple-300',
        headerGradient: 'bg-gradient-to-b from-purple-900/40 to-dark-950',
        filter: (event) => !event.title.includes('BANK') && 
                          !event.title.includes('HEIST') && 
                          !event.title.includes('POLICE') && 
                          !event.title.includes('RACING') &&
                          !event.title.includes('MONEY') &&
                          !event.title.includes('VEHICLE'),
        keywords: ['SPECIAL', 'VIP', 'HUNT']
    },
    money: {
        id: 'money',
        name: 'Money',
        icon: 'fa-money-bill-wave',
        color: 'green',
        bgClass: 'bg-green-900/70',
        borderClass: 'border-green-900/40',
        countBgClass: 'bg-green-900/30',
        countTextClass: 'text-green-300',
        headerGradient: 'bg-gradient-to-b from-green-900/40 to-dark-950',
        filter: (event) => event.title.includes('MONEY') || 
                         event.description.toLowerCase().includes('money') ||
                         event.description.toLowerCase().includes('cash'),
        keywords: ['MONEY', 'CASH', 'LAUNDERING']
    },
    vehicle: {
        id: 'vehicle',
        name: 'Vehicle',
        icon: 'fa-car',
        color: 'amber',
        bgClass: 'bg-amber-900/70',
        borderClass: 'border-amber-900/40',
        countBgClass: 'bg-amber-900/30',
        countTextClass: 'text-amber-300',
        headerGradient: 'bg-gradient-to-b from-amber-900/40 to-dark-950',
        filter: (event) => event.title.includes('VEHICLE') || 
                         event.description.toLowerCase().includes('car') ||
                         event.description.toLowerCase().includes('vehicle'),
        keywords: ['VEHICLE', 'CAR', 'THEFT']
    }
};

// Job categories
const jobCategories = {
    police: {
        id: 'police',
        name: 'Police',
        icon: 'fa-shield-alt', 
        color: 'blue',
        bgClass: 'bg-blue-600/20',
        borderClass: 'border-blue-600/50',
        textClass: 'text-blue-400',
        badgeClass: 'bg-blue-600/10 text-blue-300 border border-blue-600/20',
        scoreClass: 'bg-gradient-to-br from-blue-900 to-blue-800'
    },
    ems: {
        id: 'ems',
        name: 'Ambulance',
        icon: 'fa-ambulance',
        color: 'red',
        bgClass: 'bg-red-600/20',
        borderClass: 'border-red-600/50',
        textClass: 'text-red-400',
        badgeClass: 'bg-red-600/10 text-red-300 border border-red-600/20',
        scoreClass: 'bg-gradient-to-br from-red-900 to-red-800'
    },
    mechanic: {
        id: 'mechanic',
        name: 'Mechanic',
        icon: 'fa-wrench',
        color: 'green',
        bgClass: 'bg-green-600/20',
        borderClass: 'border-green-600/50',
        textClass: 'text-green-400',
        badgeClass: 'bg-green-600/10 text-green-300 border border-green-600/20',
        scoreClass: 'bg-gradient-to-br from-green-900 to-green-800'
    },
    taxi: {
        id: 'taxi',
        name: 'Taxi',
        icon: 'fa-taxi',
        color: 'yellow',
        bgClass: 'bg-yellow-600/20',
        borderClass: 'border-yellow-600/50',
        textClass: 'text-yellow-400',
        badgeClass: 'bg-yellow-600/10 text-yellow-300 border border-yellow-600/20',
        scoreClass: 'bg-gradient-to-br from-yellow-900 to-yellow-800'
    },
    realtor: {
        id: 'realtor',
        name: 'Realtor',
        icon: 'fa-home',
        color: 'purple',
        bgClass: 'bg-purple-600/20',
        borderClass: 'border-purple-600/50',
        textClass: 'text-purple-400',
        badgeClass: 'bg-purple-600/10 text-purple-300 border border-purple-600/20',
        scoreClass: 'bg-gradient-to-br from-purple-900 to-purple-800'
    },
    lawyer: {
        id: 'lawyer',
        name: 'Lawyer',
        icon: 'fa-gavel',
        color: 'indigo',
        bgClass: 'bg-indigo-600/20',
        borderClass: 'border-indigo-600/50',
        textClass: 'text-indigo-400',
        badgeClass: 'bg-indigo-600/10 text-indigo-300 border border-indigo-600/20',
        scoreClass: 'bg-gradient-to-br from-indigo-900 to-indigo-800'
    },
    citizen: {
        id: 'citizen',
        name: 'Citizens',
        icon: 'fa-users',
        color: 'blue',
        bgClass: 'bg-blue-600/20',
        borderClass: 'border-blue-600/50',
        textClass: 'text-blue-400',
        badgeClass: 'bg-blue-900/30 border border-blue-800/40',
        scoreClass: 'bg-gradient-to-br from-blue-900 to-blue-800'
    },
    default: {
        id: 'default',
        name: 'Other',
        icon: 'fa-briefcase',
        color: 'primary',
        bgClass: 'bg-primary-600/20',
        borderClass: 'border-primary-600/50',
        textClass: 'text-primary-400',
        badgeClass: 'bg-primary-600/10 text-primary-300 border border-primary-600/20',
        scoreClass: 'bg-gradient-to-br from-primary-900 to-primary-800'
    }
};

// Useful helper functions
const utils = {
    postMessage(resource, data = {}) {
        try {
            return fetch(`https://${resource}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                },
                body: JSON.stringify(data)
            }).catch((error) => {
                console.warn('FiveM connection not found, running in development mode.', error);
                // Connection error provides a successful Promise
                return Promise.resolve({ ok: true });
            });
        } catch (error) {
            console.warn('FiveM iletişim hatası:', error);
            return Promise.resolve({ ok: true });
        }
    },
    
    generateId() {
        return Math.floor(Math.random() * 100000);
    },
    
    getEventCategory(event) {
        for (const categoryKey in categories) {
            const category = categories[categoryKey];
            if (categoryKey === 'all') continue;
            
            if (category.keywords && category.keywords.some(keyword => event.title.includes(keyword))) {
                return category;
            }
            
            if (category.filter && category.filter(event)) {
                return category;
            }
        }
        return categories.special;
    },
    
    getJobCategory(job) {
        const jobKey = job ? job.toLowerCase() : 'default';
        return jobCategories[jobKey] || jobCategories.default;
    },
    
    getPlayerCardClass(job) {
        const category = this.getJobCategory(job);
        return `border-l-4 ${category.borderClass}`;
    },
    
    getScoreBadgeClass(job) {
        const category = this.getJobCategory(job);
        return category.scoreClass;
    },
    
    getJobIcon(job) {
        const category = this.getJobCategory(job);
        return `fas ${category.icon}`;
    },
    
    getJobIconSmall(job) {
        const category = this.getJobCategory(job);
        return category.icon;
    },
    
    getJobBadgeClass(job) {
        const category = this.getJobCategory(job);
        return category.badgeClass;
    },
    
    getCategoryInfo(categoryId) {
        return categories[categoryId] || categories.special;
    },
    
    getEventCategoryById(event) {
        for (const key in categories) {
            if (key === 'all') continue;
            if (categories[key].filter(event)) {
                return categories[key];
            }
        }
        return categories.special;
    },
    
    getEventIconClass(event) {
        const category = this.getEventCategory(event);
        return `text-${category.color}-400`;
    }
};

// Application starter
document.addEventListener('DOMContentLoaded', async function() {
    const addAnimationStyles = () => {
        const styleEl = document.createElement('style');
        styleEl.textContent = `
            .scoreboard-container {
                opacity: 0;
                transform: scale(0.95);
                transition: opacity 0.3s ease-out, transform 0.3s ease-out;
            }
            .scoreboard-container.active {
                opacity: 1;
                transform: scale(1);
            }
            .scoreboard-enter-active {
                animation: scoreboardIn 0.4s ease-out forwards;
            }
            .scoreboard-leave-active {
                animation: scoreboardOut 0.3s ease-in forwards;
            }
            @keyframes scoreboardIn {
                0% {
                    opacity: 0;
                    transform: scale(0.9) translateY(-10px);
                }
                100% {
                    opacity: 1;
                    transform: scale(1) translateY(0);
                }
            }
            @keyframes scoreboardOut {
                0% {
                    opacity: 1;
                    transform: scale(1);
                }
                100% {
                    opacity: 0;
                    transform: scale(0.95);
                }
            }
            .fade-enter-active, .fade-leave-active {
                transition: opacity 0.2s ease;
            }
            .fade-enter, .fade-leave-to {
                opacity: 0;
            }
            
            /* Tüm scrollbarları başlangıçta gizle */
            ::-webkit-scrollbar {
                width: 0 !important;
                height: 0 !important;
                display: none !important;
                visibility: hidden !important;
                opacity: 0 !important;
            }
            * {
                scrollbar-width: none !important;
                -ms-overflow-style: none !important;
            }
            .scrollable, [class*="overflow-"], [class*="overflow-y-"], [class*="overflow-x-"] {
                overflow: hidden !important;
                overflow-x: hidden !important;
                overflow-y: hidden !important;
            }
            body {
                overflow: hidden !important;
            }
        `;
        document.head.appendChild(styleEl);
    };
    
    addAnimationStyles();
    
    const mainContainer = document.getElementById('app');
    if (mainContainer) {
        mainContainer.classList.add('scoreboard-container');
    }
    
    // Create Vue application
    const app = new Vue({
        el: '#app',
        data: {
            ui: false,
            showContent: false,
            isAnimating: false,
            isClosing: false,
            players: [],
            events: [],
            policeCount: 0,
            emsCount: 0,
            mechanicCount: 0,
            taxiCount: 0,
            lawyerCount: 0,
            realtorCount: 0,
            citizenCount: 0,
            loadedModCount: 26,
            jobCounts: {}, // Player count by profession
            
            // For search and filtering
            searchQuery: '',
            activeFilter: 'all',
            sortBy: 'name',
            searchDebounceTimeout: null,
            
            // For Server Events filtering and sorting
            activeEventFilter: 'all',
            eventSortBy: 'time',
            eventSearchQuery: '',
            version: 'v0.8.1',
            currentTab: 'all',
            selectedServer: 'all',
            selectedClass: 'all',
            selectedMapFilter: 'all',
            selectedPingFilter: 'all',
            showOffline: true,
            expandedPlayer: null,
            loading: false,
            loadingMessage: '',
            loadingProgress: 0,
            activeMenu: 'scoreboard',
            pingValue: 0,
            serverIdentifier: '',
            showFivem: false,
            showServerInfo: false,
            showQbCore: false,
            showPoliceDuty: false,
            showEMSDuty: false,
            showDojDuty: false,
            isAdmin: false,
            adminActions: false,
            isMaximized: false,
            isDragging: false,
            playerCount: 0,
            maxPlayerCount: 0
        },
        computed: {
            // Category list (as sorted array)
            categoriesList() {
                return Object.values(categories);
            },
            
            // Visible job cards
            visibleJobs() {
                return Object.values(jobCategories).filter(job => job.id !== 'default');
            },

            // Search and filtering results
            filteredPlayers() {
                // First filter by search query
                let filtered = this.players;
                
                // If there's a search query
                if (this.searchQuery) {
                    const query = this.searchQuery.toLowerCase();
                    filtered = filtered.filter(player => 
                        player.name.toLowerCase().includes(query) || 
                        player.job.toLowerCase().includes(query)
                    );
                }
                
                // Then filter by active filter
                if (this.activeFilter !== 'all') {
                    if (this.activeFilter === 'police') {
                        filtered = filtered.filter(player => player.job === 'police');
                    } else if (this.activeFilter === 'citizen') {
                        filtered = filtered.filter(player => 
                            !['police', 'ambulance', 'mechanic', 'taxi', 'lawyer', 'realtor'].includes(player.job)
                        );
                    } else if (this.activeFilter === 'ems') {
                        filtered = filtered.filter(player => player.job === 'ambulance');
                    } else if (this.activeFilter === 'mechanic') {
                        filtered = filtered.filter(player => player.job === 'mechanic');
                    } else if (this.activeFilter === 'taxi') {
                        filtered = filtered.filter(player => player.job === 'taxi');
                    } else if (this.activeFilter === 'lawyer') {
                        filtered = filtered.filter(player => player.job === 'lawyer');
                    }
                }
                
                // Sorting
                if (this.sortBy === 'name') {
                    filtered = [...filtered].sort((a, b) => a.name.localeCompare(b.name));
                } else if (this.sortBy === 'ping') {
                    filtered = [...filtered].sort((a, b) => a.ping - b.ping);
                } else if (this.sortBy === 'job') {
                    filtered = [...filtered].sort((a, b) => a.job.localeCompare(b.job));
                }
                
                return filtered;
            },
            
            // Filtered events list for Server Events
            filteredEvents() {
                // First filter by search query
                let filtered = this.events;
                
                // If there is a search query
                if (this.eventSearchQuery) {
                    const query = this.eventSearchQuery.toLowerCase();
                    filtered = filtered.filter(event => 
                        event.title.toLowerCase().includes(query) || 
                        event.description.toLowerCase().includes(query)
                    );
                }
                
                // Then filter by active filter
                if (this.activeEventFilter !== 'all') {
                    // Get filter function from category object
                    const categoryInfo = categories[this.activeEventFilter];
                    if (categoryInfo && categoryInfo.filter) {
                        filtered = filtered.filter(event => categoryInfo.filter(event));
                    }
                }
                
                // Sorting
                if (this.eventSortBy === 'time') {
                    filtered = [...filtered].sort((a, b) => a.id - b.id); // Sort by ID (default)
                } else if (this.eventSortBy === 'popularity') {
                    filtered = [...filtered].sort((a, b) => (b.id % 7) - (a.id % 7)); // Random popularity for demo
                } else if (this.eventSortBy === 'reward') {
                    filtered = [...filtered].sort((a, b) => (25000 + b.id * 5000) - (25000 + a.id * 5000)); // Sort by reward
                }
                
                return filtered;
            },
            
            // Event counts by different categories
            heistEvents() {
                return this.events.filter(event => 
                    event.title.includes('BANK') || 
                    event.title.includes('HEIST')
                );
            },
            policeEvents() {
                return this.events.filter(event => 
                    event.title.includes('POLICE')
                );
            },
            racingEvents() {
                return this.events.filter(event => 
                    event.title.includes('RACING')
                );
            },
            specialEvents() {
                return this.events.filter(event => 
                    !event.title.includes('BANK') && 
                    !event.title.includes('HEIST') && 
                    !event.title.includes('POLICE') && 
                    !event.title.includes('RACING') &&
                    !event.title.includes('MONEY') &&
                    !event.title.includes('VEHICLE')
                );
            },
            moneyEvents() {
                return this.events.filter(event => 
                    event.title.includes('MONEY') || 
                    event.description.toLowerCase().includes('money') ||
                    event.description.toLowerCase().includes('cash')
                );
            },
            vehicleEvents() {
                return this.events.filter(event => 
                    event.title.includes('VEHICLE') || 
                    event.description.toLowerCase().includes('car') ||
                    event.description.toLowerCase().includes('vehicle')
                );
            },
            
            // Left column filtered players
            leftFilteredPlayers() {
                return this.filteredPlayers.slice(0, Math.ceil(this.filteredPlayers.length / 2));
            },
            
            // Right column filtered players
            rightFilteredPlayers() {
                return this.filteredPlayers.slice(Math.ceil(this.filteredPlayers.length / 2));
            },
            
            // Old columns (for backward compatibility)
            leftPlayers() {
                return this.players.slice(0, Math.ceil(this.players.length / 2));
            },
            rightPlayers() {
                return this.players.slice(Math.ceil(this.players.length / 2));
            }
        },
        methods: {
            // Event handlers
            handleEventMessage(e) {
                const data = e.data;
                if (!data) return;

                try {
                    if (data.action === 'show') {
                        this.ui = true;
                        this.showContent = true;
                        this.applyAnimationClass();
                        if (data.events) {
                            this.events = data.events;
                        }
                        this.loading = false;
                        
                        // Menü açıldığında scrollable containerları aktifleştir
                        setTimeout(() => {
                            this.enableScrollableContainers();
                        }, 200);
                    } else if (data.action === 'showLoading') {
                        this.loading = true;
                        this.loadingMessage = data.message || 'Loading...';
                    } else if (data.action === 'hideLoading') {
                        this.loading = false;
                    } else if (data.action === 'hide') {
                        console.log('Hide action received');
                        this.hideScrollbars();
                        this.showContent = false;
                        this.removeAnimationClass();
                        setTimeout(() => {
                            this.ui = false;
                            this.hideScrollbars();
                        }, 300);
                    } else if (data.action === 'updatePlayers') {
                        if (data.players) {
                            this.players = data.players;
                            this.policeCount = data.policeCount || 0;
                            this.emsCount = data.emsCount || 0;
                            this.mechanicCount = data.mechanicCount || 0;
                            this.taxiCount = data.taxiCount || 0;
                            this.lawyerCount = data.lawyerCount || 0;
                            this.realtorCount = data.realtorCount || 0;
                            this.citizenCount = data.citizenCount || 0;
                            
                            this.updateJobCounts();
                            
                            // Oyuncu verileri güncellendiğinde scrollable containerları aktifleştir
                            this.enableScrollableContainers();
                        }
                    } else if (data.action === 'hideScrollbars') {
                        this.hideScrollbars();
                    } else if (data.action === 'resetScrollbars') {
                        this.hideScrollbars();
                    }
                } catch (err) {
                    console.error('Error processing message:', err);
                }
            },
            
            // Close scoreboard
            closeScoreboard() {
                $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
                this.ui = false;
            },
            
            // Get player count for job
            getJobCount(jobId) {
                if (jobId === 'citizen') {
                    return this.citizenCount;
                } else if (jobId === 'police') {
                    return this.policeCount;
                } else if (this.jobCounts[jobId]) {
                    return this.jobCounts[jobId];
                } else {
                    // Test için sabit değerler (gerçek uygulamada API'den alınacak)
                    const defaultCounts = {
                        'ems': 4,
                        'mechanic': 3,
                        'taxi': 3,
                        'realtor': 1,
                        'lawyer': 2,
                        'judge': 1
                    };
                    return defaultCounts[jobId] || 0;
                }
            },

            updateJobCounts() {
                try {
                    this.jobCounts = {
                        police: this.policeCount || 0,
                        ambulance: this.emsCount || 0,
                        mechanic: this.mechanicCount || 0,
                        taxi: this.taxiCount || 0,
                        lawyer: this.lawyerCount || 0,
                        realtor: this.realtorCount || 0,
                        citizen: this.citizenCount || 0
                    };
                    const totalPlayers = this.players.length;
                    const specialJobs = ['police', 'ambulance', 'mechanic', 'taxi', 'lawyer', 'realtor'];
                    const specialJobsCount = specialJobs.reduce((acc, job) => acc + (this.jobCounts[job] || 0), 0);
                    if (this.citizenCount === 0) {
                        this.citizenCount = Math.max(0, totalPlayers - specialJobsCount);
                    }
                } catch (err) {
                    console.error('Job count güncelleme hatası:', err);
                }
            },
            
            scrollJobsLeft() {
                if (this.$refs.jobsContainer) {
                    this.$refs.jobsContainer.scrollBy({ left: -200, behavior: 'smooth' });
                }
            },
            
            scrollJobsRight() {
                if (this.$refs.jobsContainer) {
                    this.$refs.jobsContainer.scrollBy({ left: 200, behavior: 'smooth' });
                }
            },

            scrollEventTabsLeft() {
                if (this.$refs.eventTabsContainer) {
                    this.$refs.eventTabsContainer.scrollBy({ left: -150, behavior: 'smooth' });
                }
            },
            
            scrollEventTabsRight() {
                if (this.$refs.eventTabsContainer) {
                    this.$refs.eventTabsContainer.scrollBy({ left: 150, behavior: 'smooth' });
                }
            },
            
            scrollEventsLeft() {
                if (this.$refs.eventsContainer) {
                    const container = this.$refs.eventsContainer;
                    container.style.overflowX = 'auto';
                    container.scrollBy({ left: -330, behavior: 'smooth' });
                    
                    // Kaydırma işleminden sonra container özelliklerini kontrol et
                    setTimeout(() => {
                        console.log('Events container scrolling left');
                    }, 100);
                } else {
                    console.log('Events container reference not found');
                }
            },
            
            // Scroll event cards to the right
            scrollEventsRight() {
                if (this.$refs.eventsContainer) {
                    const container = this.$refs.eventsContainer;
                    container.style.overflowX = 'auto';
                    container.scrollBy({ left: 330, behavior: 'smooth' });
                    
                    // Kaydırma işleminden sonra container özelliklerini kontrol et
                    setTimeout(() => {
                        console.log('Events container scrolling right');
                    }, 100);
                } else {
                    console.log('Events container reference not found');
                }
            },
            
            // Manage search with debounce
            handleSearch() {
                clearTimeout(this.searchDebounceTimeout);
                this.searchDebounceTimeout = setTimeout(() => {
                    // Update search results in real-time
                    // Search query is already processed through computed property
                }, 300); // 300ms debounce
            },
            
            handlePlayerListScroll(event) {
                if (this.$refs.playerListContainer) {
                    const container = this.$refs.playerListContainer;
                    if (container.scrollTop > 20) {
                        container.classList.add('scrolled-down');
                    } else {
                        container.classList.remove('scrolled-down');
                    }
                }
            },
            
            // Clear search
            clearSearch() {
                this.searchQuery = '';
                this.activeFilter = 'all';
                this.sortBy = 'name';
            },
            
            // Toggle filter
            toggleFilter(filter) {
                this.activeFilter = filter;
            },
            
            // Set event filter for Server Events
            setEventFilter(filter) {
                this.activeEventFilter = filter;
                
                // Reset scroll to top when tab changes
                if (this.$refs.eventsContainer) {
                    this.$refs.eventsContainer.scrollLeft = 0;
                }
            },
            
            // Change sort for Server Events
            sortEvents() {
                // Sorting is automatically done by computed property
                // This method is added for performing actions when select changes
                console.log('Events sorted by:', this.eventSortBy);
            },
            
            // Add helper methods to methods
            getPlayerCardClass(job) {
                return utils.getPlayerCardClass(job);
            },
            getScoreBadgeClass(job) {
                return utils.getScoreBadgeClass(job);
            },
            getJobIcon(job) {
                return utils.getJobIcon(job);
            },
            getJobIconSmall(job) {
                return utils.getJobIconSmall(job);
            },
            getJobBadgeClass(job) {
                return utils.getJobBadgeClass(job);
            },
            getEventCardClass(title) {
                return utils.getEventCardClass(title);
            },
            getEventIconClass(title) {
                return utils.getEventIconClass(title);
            },
            
            loadMockData() {
                this.players = [];
                this.events = [];
                this.policeCount = 0;
                this.emsCount = 0;
                this.mechanicCount = 0;
                this.taxiCount = 0;
                this.lawyerCount = 0;
                this.realtorCount = 0;
                this.citizenCount = 0;
                this.updateJobCounts();
            },
            
            getCategoryCount(categoryId) {
                if (!categoryId || categoryId === 'all') return this.events.length;
                
                const categoryInfo = categories[categoryId];
                if (!categoryInfo || !categoryInfo.filter) return 0;
                
                return this.events.filter(event => categoryInfo.filter(event)).length;
            },
            
            getEventCategory(event) {
                return utils.getEventCategory(event);
            },

            closePlayerMenus(event) {
                // We leave this function empty, no longer needed
            },
            
            applyAnimationClass() {
                try {
                    const container = document.querySelector('.scoreboard-container');
                    if (container) {
                        container.classList.add('active');
                        container.classList.add('scoreboard-enter-active');
                        setTimeout(() => {
                            try {
                                container.classList.remove('scoreboard-enter-active');
                            } catch (err) {
                                console.error('Animasyon sınıfı kaldırma hatası:', err);
                            }
                        }, 500);
                    }
                } catch (err) {
                    console.error('Animasyon uygulama hatası:', err);
                }
            },
            
            removeAnimationClass() {
                try {
                    const container = document.querySelector('.scoreboard-container');
                    if (container) {
                        container.classList.remove('active');
                        container.classList.add('scoreboard-leave-active');
                        setTimeout(() => {
                            try {
                                container.classList.remove('scoreboard-leave-active');
                            } catch (err) {
                                console.error('Animasyon sınıfı kaldırma hatası:', err);
                            }
                        }, 400);
                    }
                } catch (err) {
                    console.error('Animasyon kaldırma hatası:', err);
                }
            },

            onKeydown(e) {
                try {
                    if (e.key === 'Escape' && this.ui && !this.isClosing) {
                        this.closeScoreboard();
                    }
                } catch (err) {
                    console.error('Klavye olay hatası:', err);
                    try {
                        this.ui = false;
                        this.isClosing = false;
                        this.showContent = false;
                        utils.postMessage('es-scoreboard', {
                            action: 'close'
                        });
                    } catch (e) {
                        console.error('Acil kapama hatası:', e);
                    }
                }
            },
            
            hideScrollbars() {
                try {
                    // Özel stil ekle
                    const styleId = 'hide-scrollbars-style';
                    let styleEl = document.getElementById(styleId);
                    if (!styleEl) {
                        styleEl = document.createElement('style');
                        styleEl.id = styleId;
                        document.head.appendChild(styleEl);
                    }

                    styleEl.textContent = `
                        ::-webkit-scrollbar {
                            width: 0 !important;
                            height: 0 !important;
                            display: none !important;
                            visibility: hidden !important;
                            opacity: 0 !important;
                        }
                        * {
                            scrollbar-width: none !important;
                            -ms-overflow-style: none !important;
                        }
                        .scrollable, [class*="overflow-"], [class*="overflow-y-"], [class*="overflow-x-"] {
                            overflow: hidden !important;
                            overflow-x: hidden !important;
                            overflow-y: hidden !important;
                        }
                        
                        /* Scrollable container sınıfına sahip elementler için özel kurallar */
                        .scrollable-container {
                            overflow-y: auto !important;
                            pointer-events: auto !important;
                        }
                        
                        body {
                            overflow: hidden !important;
                        }
                    `;

                    document.body.classList.remove('scoreboard-inactive');

                    const mainElements = document.querySelectorAll('#app, #app *, button, input, select, .player-list, .team-row');
                    mainElements.forEach(el => {
                        el.style.pointerEvents = 'auto';
                    });

                    this.enableScrollableContainers();
                    
                    console.log('Scrollbars hidden, scrollable containers preserved');
                } catch (err) {
                    console.error('Error hiding scrollbars:', err);
                }
            },
            
            enableScrollableContainers() {
                try {
                    const scrollableContainers = document.querySelectorAll('.scrollable-container');
                    console.log(`Found ${scrollableContainers.length} scrollable containers`);
                    scrollableContainers.forEach((el, index) => {
                        el.style.overflowY = 'auto';
                        el.style.overflowX = 'auto';
                        el.style.pointerEvents = 'auto';
                        el.setAttribute('data-scrollable', 'true');

                        const scrollStyle = document.createElement('style');
                        scrollStyle.textContent = `
                            .scrollable-container[data-scrollable="true"] {
                                overflow-y: auto !important;
                                overflow-x: auto !important;
                                pointer-events: auto !important;
                            }
                        `;
                        document.head.appendChild(scrollStyle);
                        
                        console.log(`Enabled scrolling for container ${index + 1}`);

                        if (el.classList.contains('overflow-y-auto') || el.id === 'playerListContainer') {
                            el.style.overflowY = 'auto';
                            el.style.overflowX = 'hidden';
                        }
                        
                        // Yatay kaydırma için
                        if (el.classList.contains('overflow-x-auto') || el.id === 'eventsContainer') {
                            el.style.overflowX = 'auto';
                            el.style.overflowY = 'hidden';
                        }
                    });

                    const eventsContainer = document.getElementById('eventsContainer');
                    if (eventsContainer) {
                        eventsContainer.style.overflowX = 'auto';
                        eventsContainer.style.pointerEvents = 'auto';
                        console.log('Events container horizontal scrolling enabled');
                    }
                } catch (err) {
                    console.error('Error enabling scrollable containers:', err);
                }
            },
            
            toggleUi(toggle) {
                console.log('toggleUi called with:', toggle);
                if (toggle === undefined) {
                    this.ui = !this.ui;
                } else {
                    this.ui = toggle;
                }

                if (!this.ui) {
                    document.body.classList.add('scoreboard-inactive');
                    this.hideScrollbars();
                    console.log('UI kapatıldı, scrollbarlar gizlendi');
                } else {
                    document.body.classList.remove('scoreboard-inactive');
                    console.log('UI açıldı, scoreboard-inactive sınıfı kaldırıldı');

                    setTimeout(() => {
                        this.enableScrollableContainers();
                    }, 100);
                }
            }
        },
        created() {
            window.addEventListener('message', this.handleEventMessage);
            document.addEventListener('keydown', this.onKeydown);

            this.hideScrollbars();
            
            this.loadMockData();
        },
        mounted() {
            this.$nextTick(() => {
                const container = document.querySelector('.scoreboard-container');
                if (container) {
                    if (this.ui) {
                        setTimeout(() => {
                            container.classList.add('active');
                        }, 50);
                    }
                }
                
                this.hideScrollbars();
            });
        },
        beforeDestroy() {
            window.removeEventListener('message', this.handleEventMessage);
            document.removeEventListener('keydown', this.onKeydown);
        }
    });
    
    window.addEventListener("message", function(e) {
        const data = e.data;
        if (!data) return;
        
        if (app) {
            app.handleEventMessage(e);
        }
    });

    console.log('Scoreboard loaded');
});