// Gather each of our accordion components.
document.querySelectorAll('.accordion').forEach(($accordion) => {
    const $show = $accordion.querySelector('.show');
    const $hide = $accordion.querySelector('.hide');
    const $content = $accordion.querySelector('article');

    function toggle() {
        [$hide, $show, $content].forEach(($el) => {
            $el.dataset.visible = !($el.dataset.visible == 'true');
        });
    }

    $show.addEventListener('click', toggle);
    $hide.addEventListener('click', toggle);
});

document.querySelectorAll('.tabs').forEach(($tabs) => {
    // Get each button in each tab component.
    $tabs.querySelectorAll('nav div').forEach(($button) => {

        // Add a handler to each button for 'click' events.
        $button.addEventListener('click', function () {
            let selectedIndex = 0;

            // Update the state for each button.
            $tabs.querySelectorAll('nav div').forEach(($otherButton, index) => {
                if ($otherButton !== $button) {
                    delete $otherButton.dataset.selected;
                } else {
                    selectedIndex = index;
                    $button.dataset.selected = true;
                }
            });

            // Update the state for each panel.
            $tabs.querySelectorAll('.tab').forEach(($otherTab, index) => {
                if (index != selectedIndex) {
                    delete $otherTab.dataset.selected;
                } else {
                    $otherTab.dataset.selected = true;
                }
            });
        });
    });
});
