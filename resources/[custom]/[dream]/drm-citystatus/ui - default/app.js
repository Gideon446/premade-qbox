let lastStatusUpdate = 0;
const debounceTime = 500;
let lastStatusChange = 0;
const statusCooldown = 2000;
const processingDelay = 1000;

window.addEventListener('message', function(event) {
    const now = Date.now();

    if (event.data.action == "openlist") {
        $(".intro").css("display", "flex");
        $("#playerName").html(`Welcome, ${event.data.name}`);
        $("#activeUsers").text(event.data.activePolice || 0);
        $(".tb-pop").empty();

        const isOnCooldown = (now - lastStatusChange < statusCooldown + processingDelay);
        const list = event.data.list;
        const active = event.data.active || "safe";
        for (let l in list) {
            let isActive = (l == active) ? "disabled" : "";
            let isDisabled = isOnCooldown ? "temp-disabled" : "";
            let icon, description;
            switch(l) {
                case "safe": icon = "fa-check-circle"; description = "City is secure"; break;
                case "cooldown": icon = "fa-hourglass-half"; description = "Cooldown period"; break;
                case "inprogress": icon = "fa-exclamation-triangle"; description = "Situation ongoing"; break;
                case "meeting": icon = "fa-users-cog"; description = "Police in meeting"; break;
                case "honhold": icon = "fa-pause-circle"; description = "On hold"; break;
                case "inactive": icon = "fa-user-slash"; description = "Low presence"; break;
                default: icon = "fa-user-slash"; description = "Default status";
            }
            $(".tb-pop").append(
                `<button class="control-button ${isActive} ${isDisabled}" data-ptype="${l}">
                    <i class="fas ${icon} text-3xl text-orange-500 mb-4"></i>
                    <h3 class="text-lg font-semibold whitespace-nowrap">${list[l].label}</h3>
                    <p class="text-sm text-gray-400 mt-3 text-center">${description}</p>
                </button>`
            );
        }
        if (isOnCooldown) setTimeout(() => $(".control-button.temp-disabled").removeClass("temp-disabled"), (statusCooldown + processingDelay) - (now - lastStatusChange));
    } else if (event.data.action == "showstatus") {
        if (now - lastStatusUpdate < debounceTime) return;
        lastStatusUpdate = now;
        let active = event.data.active || { label: "City Safe" };
        let type = event.data.type || "safe";
        let cooldown = event.data.cooldown || "00:00";
        $("#prioText").attr("data-status", type).find(".status-label").html(type === "cooldown" ? `COOLDOWN: ${cooldown}` : active.label);
    } else if (event.data.action == "updateLogs") {
        $("#activityLog").empty();
        event.data.logs.forEach(log => addLogEntry(log.user, log.status, log.timestamp));
    } else if (event.data.action == "toggleNotify") {
        $("#prioText").css("display", event.data.visible ? "flex" : "none");
    }
});

$(document).ready(function() {
    $("#prioText").attr("data-status", "safe").find(".status-label").html("City Safe").css("display", "flex");

    $('.tb-pop').on('click', '.control-button', function() {
        if ($(this).hasClass("disabled") || $(this).hasClass("temp-disabled")) return;
        const now = Date.now();
        if (now - lastStatusChange < statusCooldown + processingDelay) return;
        lastStatusChange = now;

        var ptype = $(this).data("ptype");
        CloseUi();
        $.post(`https://${GetParentResourceName()}/setprio`, JSON.stringify({ ptype }));
        $(".control-button").addClass("temp-disabled");
        setTimeout(() => $(".control-button.temp-disabled").removeClass("temp-disabled"), statusCooldown + processingDelay);
    });

    $('#themeToggle').on('click', function() {
        $('body').toggleClass('dark-theme');
        const isDark = $('body').hasClass('dark-theme');
        $(this).html(`<i class="fas ${isDark ? 'fa-moon' : 'fa-sun'} text-orange-400 text-xl"></i>`);
        localStorage.setItem('theme', isDark ? 'dark' : 'light');
    });

    if (localStorage.getItem('theme') === 'dark') {
        $('body').addClass('dark-theme');
        $('#themeToggle').html('<i class="fas fa-moon text-orange-400 text-xl"></i>');
    }

    setInterval(() => {
        $("#activityLog time").each(function() {
            const timestamp = $(this).data("timestamp");
            if (timestamp) {
                const timeAgo = Math.floor((Date.now() / 1000 - timestamp) / 60);
                $(this).text(timeAgo <= 0 ? "Just now" : `${timeAgo} minute${timeAgo === 1 ? "" : "s"} ago`);
            }
        });
    }, 60000);
});

$(document).keydown(function(e) {
    if (e.keyCode == 27) {
        CloseUi();
        $.post(`https://${GetParentResourceName()}/close`);
    }
});

function CloseUi() {
    $(".intro").css("display", "none");
}

function addLogEntry(user, status, timestamp) {
    const statusClasses = {
        "safe": "status-safe",
        "cooldown": "status-cooldown",
        "inprogress": "status-inprogress",
        "meeting": "status-meeting",
        "honhold": "status-honhold",
        "inactive": "status-inactive"
    };
    const statusNames = {
        "safe": "City Safe",
        "cooldown": "CoolDown",
        "inprogress": "In Progress",
        "meeting": "Police Meeting",
        "honhold": "On Hold",
        "inactive": "Inactive"
    };
    const displayStatus = statusNames[status] || "Unknown";
    const displayClass = statusClasses[status] || "status-safe";
    const timeAgo = Math.floor((Date.now() / 1000 - timestamp) / 60);
    $("#activityLog").prepend(
        `<div class="border-l-4 border-cyan-400 pl-4 py-3 bg-cyan-900/20 rounded-r-lg shadow-sm">
            <p class="text-sm whitespace-nowrap">
                <span class="font-medium text-cyan-300">${user}</span> set status to 
                <span class="status-badge ${displayClass}">${displayStatus}</span>
            </p>
            <time class="text-xs text-gray-400 mt-1 block" data-timestamp="${timestamp}">${timeAgo <= 0 ? "Just now" : `${timeAgo} minute${timeAgo === 1 ? "" : "s"} ago`}</time>
        </div>`
    );
}