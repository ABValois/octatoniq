
<template>
  <div style="padding:20px">
    <b-card>
      <h1>Wanna learn how to make your own website?</h1><br>

      An example can be a big help! I have all code for both making this site and deploying it in
      <a href="https://github.com/ABValois/octatoniq">a repository on Github.</a>
      Here is <a href="https://github.com/ABValois/octatoniq/blob/master/site/src/components/ThisSite.vue">the page you are reading right now!</a>
      <br><br>

      The site itself is powered by the <a href="https://vuejs.org/">Vue.js framework</a> amd uses 
      <a href="https://bootstrap-vue.org/">Bootstrap</a> heavily to make things look nice.
      <br><br>

      To host the site, I utilize Amazon Web Services. I use <a href="https://aws.amazon.com/s3/">S3</a> to host the website files, and 
      <a href="https://aws.amazon.com/cloudfront/">Cloudfront</a>  to serve them.
      <br><br>

      Finally, when deploying the site, I use <a href="https://www.terraform.io/">Terraform</a>, which uses a simple declarative language to read 
      and deploy all the hosting infrastructure from <a href="https://github.com/ABValois/octatoniq/tree/master/terraform">code stored in the site repository.</a>
      <br><br>

      All told, this costs me around ~$20 a year ($12 of which goes to registering my domain name), and I get complete control over every part of the site! 
      <br><br>

      It can be daunting to tackle a project like hosting a site when you have never done something like that before, but don't worry: there are 
      <a href="https://www.google.com/search?q=host+vue+site+on+cloudfront">PLENTY of resources to help you along on the internet.</a>
      <br>
      I learned most of this myself by googling things while I was in college and a junior engineer. But lucky you! You found this site, and 
      <a href="https://github.com/ABValois/octatoniq">my example,</a> and you can start by simply downloading it and trying to run it yourself!
      <br><br>

      Once you have my example running, you can play around with things and make it suit your needs better/figure out how things work. Happy websiting!
    </b-card>
  </div>
</template>
