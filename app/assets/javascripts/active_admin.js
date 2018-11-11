//= require active_admin/base
//= require tinymce

TinyMCERails.configuration.default = {
  selector: "textarea.tinymce",
  toolbar: ["styleselect | bold italic | undo redo", "link | uploadimage | codesample | media | alignleft alignright | outdent indent | bullist numlist"],
  plugins: "link,uploadimage,codesample,media"
};
TinyMCERails.initialize('default', {
});
