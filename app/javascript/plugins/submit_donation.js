const submitDonationForm = () => {
  const form = document.querySelector("#new_donation")
  const img = document.querySelector("#btn-submit-donation")

  if (img) {
    img.addEventListener('click', () => {
      form.submit()
    })
  }
}

export { submitDonationForm }
