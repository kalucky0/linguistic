use nwd::NwgUi;

#[derive(Default, NwgUi)]
pub struct App {
    #[nwg_resource(source_file: Some("icon.ico"))]
    icon: nwg::Icon,

    #[nwg_control(size: (1200, 700), title: "Linguistic", accept_files: true, center: true, icon: Some(&data.icon))]
    #[nwg_events(OnWindowClose: [App::exit], OnInit: [App::setup_view], OnFileDrop: [App::file_drop(SELF, EVT_DATA)], OnResize: [App::resize], OnWindowMaximize: [App::resize], OnWindowMinimize: [App::resize])]
    window: nwg::Window,

    #[nwg_resource(family: "Segoe UI", size: 15)]
    segoe: nwg::Font,

    #[nwg_control(parent: window, text: "&File")]
    menu_bar: nwg::Menu,

    #[nwg_control(parent: menu_bar, text: "&Open")]
    #[nwg_events(OnMenuItemSelected: [App::open_file])]
    menu_open: nwg::MenuItem,

    #[nwg_control(parent: menu_bar, text: "E&xit")]
    #[nwg_events(OnMenuItemSelected: [App::exit])]
    menu_exit: nwg::MenuItem,

    #[nwg_control(parent: window, font: Some(&data.segoe))]
    tabs_container: nwg::TabsContainer,
}

impl App {
    fn setup_view(&self) {
        // ...
        self.resize();
    }

    fn open_file(&self) {
        let mut file_dialog = Default::default();
        nwg::FileDialog::builder()
            .title("Open JSON file")
            .action(nwg::FileDialogAction::Open)
            .multiselect(false)
            .filters("JSON(*.json)|All files (*.*)")
            .build(&mut file_dialog)
            .unwrap();

        file_dialog.run(Some(&self.window));

        let result = file_dialog.get_selected_item();
        if result.is_ok() {
            let path = result.unwrap();
            // load data
        }
    }

    fn file_drop(&self, data: &nwg::EventData) {
        let drop = data.on_file_drop();
        let file = &drop.files()[0];
        // load data
    }

    fn resize(&self) {
        let (w, h) = self.window.size();
        self.tabs_container.set_size(w, h - 2);
    }

    fn exit(&self) {
        nwg::stop_thread_dispatch();
    }
}