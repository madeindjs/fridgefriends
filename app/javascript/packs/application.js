import "bootstrap";
import "../plugins/flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

import { submitDonationForm } from "../plugins/submit_donation"

submitDonationForm();

 $(".spoiler-trigger").click(function() {
    $(this).parent().next().collapse('toggle');
  });

$('#exampleModal').modal()
