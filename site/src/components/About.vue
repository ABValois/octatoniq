
<template>
    <div>
        <br>
        <b-row>
            <b-col> 
                <b-card>
                    Octatoniq
                </b-card>
            </b-col>
            <b-col>
                <b-card>
                    {{bio_1}}
                </b-card>
                <br>
                <b-card>
                    {{bio_2}}
                </b-card>
            </b-col>
        </b-row>
    </div>
</template>

<script>
export default {
    data() {
        return {
            bio_1: "\
                    Octatoniq is the creative front run by Alex Valois.\
                    Board games, music, technology - everything Alex does, Octatoniq does.\
                    ",
            bio_2: "\
                    Alex got his Bachelor of Science from the University of Wisconsin-Madison, majoring in Computer Engineering, Computer Science, and Percussion Performance.\
                    He now works as an Information Security Engineer, while still spending his free time pursuing his many interests.\
                    ",
        }
    }
}
</script>
