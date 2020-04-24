
<template>
    <div>
        <br>
        <b-row style="padding:20px">
            <b-col> 
                <b-card>
                    <h1>Octatoniq? What does that mean?</h1><br>
                    <b-card> {{name_bio}} </b-card>
                </b-card><br>
                <b-card>
                    <h1>Okay, so what is it?</h1><br>
                    <b-card> {{ocatatoniq_bio}} </b-card>
                </b-card><br>
                <b-card>
                    <h1>Who is this Alex guy?</h1><br>
                    <b-card> {{alex_bio}} </b-card>
                </b-card><br>
                <b-card>
                    <h1>So what can I do on this site?</h1><br>
                    <b-card> {{alex_bio}} </b-card>
                </b-card><br>
            </b-col>
            <b-col>
                <b-card>
                    Images go on this side
                </b-card>
            </b-col>
        </b-row>
    </div>
</template>

<script>
export default {
    data() {
        return {
            name_bio: "\
                    Octatoniq is the creative front run by Alex Valois.\
                    Board games, music, technology - everything Alex does, Octatoniq does.\
                    ",
            ocatatoniq_bio: "\
                    Octatoniq is the creative front run by Alex Valois.\
                    Board games, music, technology - everything Alex does, Octatoniq does.\
                    ",
            alex_bio: "\
                    Alex got his Bachelor of Science from the University of Wisconsin-Madison, majoring in Computer Engineering, Computer Science, and Percussion Performance.\
                    He now works as an Information Security Engineer, while still spending his free time pursuing his many interests.\
                    ",
        }
    }
}
</script>
