<template>
    <br>
    <fieldset>
        <legend id = "title" class = "titles">Bills</legend>
        <br>
        <div id = "date-changer-container">
            <button class = "buttons date" id = "yesterday" title = "watch the last month bill"
                    @click = "switchYesterday">yesterday</button>
            <p class = "date">{{dateString}}</p>
            <button class = "buttons date" id = "tomorrow" title = "watch the next month bill"
                    @click = "switchTomorrow">tomorrow</button>
        </div>
        <BillList ref = "billList" :date = "date"/>
    </fieldset>
</template>

<script>
    import BillList from "../components/BillList.vue";

    export default{
        name: "BillListView",
        components: {
            BillList
        },
        data(){
            return{
                date: null,
                dateString: "",
                dateObject: null
            };
        },
        methods:{
            getDateString(date){
                let result = "";
                switch(date.getMonth()){
                    case 0:
                        result += "January";
                        break;
                    case 1:
                        result += "February";
                        break;
                    case 2:
                        result += "March";
                        break;
                    case 3:
                        result += "April";
                        break;
                    case 4:
                        result += "May";
                        break;
                    case 5:
                        result += "June";
                        break;
                    case 6:
                        result += "July";
                        break;
                    case 7:
                        result += "August";
                        break;
                    case 8:
                        result += "September";
                        break;
                    case 9:
                        result += "October";
                        break;
                    case 10:
                        result += "November";
                        break;
                    case 11:
                        result += "December";
                        break;
                    
                }
                result += " " + date.getDate() + ", " + date.getFullYear();
                return result;
            },
            getDate(date){
                let result = date.getFullYear() + "-"
                            + (date.getMonth() + 1).toString().padStart(2, "0") + "-"
                            + date.getDate().toString().padStart(2, "0");
                return result;
            },
            switchYesterday(){
                this.dateObject.setDate(this.dateObject.getDate() - 1);
                this.date = this.getDate(this.dateObject);
                this.dateString = this.getDateString(this.dateObject);
                this.$refs.billList.refresh(this.date);
            },
            switchTomorrow(){
                this.dateObject.setDate(this.dateObject.getDate() + 1);
                this.date = this.getDate(this.dateObject);
                this.dateString = this.getDateString(this.dateObject);
                this.$refs.billList.refresh(this.date);
            }
        },
        created(){
            this.dateObject = new Date();
            this.date = this.getDate(this.dateObject);
            this.dateString = this.getDateString(this.dateObject);
        }
    };
</script>

<style scoped>
    #title{
        line-height: 50px;
        width: 3em;
    }

    #date-changer-container{
        display: flex;
        justify-content: space-between;
        justify-items: left;
        align-content: center;
        align-items: center;
        padding: 5px 30px;
    }

    .date{
        color: cyan;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 18px;
        font-weight: bolder;
    }
</style>