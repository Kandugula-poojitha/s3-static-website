// Add animation to project list
const projects = document.getElementById('projects');
const projectList = projects.querySelector('ul');

projectList.addEventListener('mouseover', () => {
    projectList.classList.add('animate');
});

projectList.addEventListener('mouseout', () => {
    projectList.classList.remove('animate');
});

// Add animation to project list items
const projectItems = projectList.querySelectorAll('li');
projectItems.forEach((item) => {
    item.addEventListener('mouseover', () => {
        item.classList.add('animate');
    });

    item.addEventListener('mouseout', () => {
        item.classList.remove('animate');
    });
});

// Add animation to project links
const projectLinks = projectList.querySelectorAll('a');
projectLinks.forEach((link) => {
    link.addEventListener('mouseover', () => {
        link.classList.add('animate');
    });

    link.addEventListener('mouseout', () => {
        link.classList.remove('animate');
    });
});

// Add animation to background colors
const sections = document.querySelectorAll('section');
sections.forEach((section) => {
    const sectionBG = section.style.background;

    if (sectionBG === 'rgb(255, 255, 255)' || sectionBG === 'rgba(255, 255, 255, ...)') {
    section.style.background = '#f0f0f0';
} else if (sectionBG === 'rgb(51, 122, 183)' || sectionBG === 'rgba(51, 122, 183, ...)') {
section.style.background = '#e0e0e0';
} else if (sectionBG === 'rgb(52, 86, 126)' || sectionBG === 'rgba(52, 86, 126, ...)') {
section.style.background = '#d0d0d0';
}
});