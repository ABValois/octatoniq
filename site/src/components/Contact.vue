
<template>
  <div style="padding:20px">
    <b-card>
      <h1>Contact Alex</h1>
      If you have a question about something you've seen on this site, or would like to talk to me about a project you think I'd be a good fit for, 
      fill out the below form or reach out to me at <a href="mailto:contact@octatoniq.com">contact@octatoniq.com</a>
    </b-card>
    <br>
    <b-card>
      <b-card bg-variant="warning" style="font-weight:bold">This feature doesn't work yet and has been disabled</b-card><br>
      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <h3>From:</h3>
        <b-form-input
          id="input-email"
          v-model="form.email"
          type="email"
          required
          placeholder="Enter email address to send from"
        ></b-form-input><br>
        <h3>Subject:</h3>
        <b-form-input
          id="input-subject"
          v-model="form.subject"
          type="text"
          required
          placeholder="Enter subject line for your email"
        ></b-form-input><br>
        <h3>Message:</h3>
        <b-form-textarea
          id="input-subject"
          v-model="form.body"
          type="text"
          required
          placeholder="Enter your message body"
        ></b-form-textarea><br>
        <b-button type="submit" variant="primary">Send Message</b-button>
        <b-button type="reset" variant="danger">Reset Form</b-button>
      </b-form>
    </b-card>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        show: true,
        form: {
          email: '',
          subject: '',
          body: ''
        }
      }
    },
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        console.log(JSON.stringify(this.form))
        console.log('this isn\'t implemented yet, but thanks for trying')
      },
      onReset(evt) {
        evt.preventDefault()
        // Reset form values
        this.form.email = ''
        this.form.name = ''
        this.form.food = null
        this.form.checked = []
        // Trick to reset/clear native browser form validation state
        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      }
    }
  }
</script>

