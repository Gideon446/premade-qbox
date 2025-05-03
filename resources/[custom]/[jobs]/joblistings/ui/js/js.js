// Job icons mapping
const jobIcons = {
    police: 'fa-shield-alt',
    ambulance: 'fa-ambulance',
    mechanic: 'fa-wrench',
    taxi: 'fa-taxi',
    unemployed: 'fa-user'
};

// Main container
const container = document.getElementById('container');

// Handle messages from the game client
window.addEventListener('message', function(event) {
    var data = event.data;
    
    if (data.type === "ui") {
        if (data.status) {
            container.style.display = "flex";
            populateJobs(data.jobs);
        } else {
            container.style.display = "none";
        }
    }
});

// Populate jobs in the menu
function populateJobs(jobs) {
    const jobList = document.getElementById('jobList');
    jobList.innerHTML = ''; // Clear existing jobs

    jobs.forEach(job => {
        const jobCard = document.createElement('div');
        jobCard.className = 'job-card';
        jobCard.onclick = () => selectJob(job.name);

        const icon = jobIcons[job.name] || 'fa-briefcase';
        
        jobCard.innerHTML = `
            <i class="fas ${icon}"></i>
            <h3>${job.label}</h3>
            <p>${job.description}</p>
        `;

        jobList.appendChild(jobCard);
    });
}

// Handle job selection
function selectJob(jobName) {
    fetch(`https://${GetParentResourceName()}/jobSelected`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            job: jobName
        })
    });
}

// Close button handler
document.getElementById('closeButton').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/exit`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
});

// Close on escape key
document.addEventListener('keyup', function(event) {
    if (event.key === 'Escape') {
        fetch(`https://${GetParentResourceName()}/exit`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({})
        });
    }
});
