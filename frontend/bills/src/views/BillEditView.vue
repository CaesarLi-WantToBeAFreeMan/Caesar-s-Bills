<template>
    <div v-if = "bill">
        <h2>Edit Bill</h2>
        <BillForm :billData = "bill" @submit = "updateBill"/>
    </div>
</template>

<script>
    import BillForm from "@/components/BillForm.vue";
    import BillService from "@/services/BillService";

    export default{
        components:{
            BillForm
        },
        data(){
            return{
                bill: null
            };
        },
        methods:{
            fetchBill(){
                BillService.getBillById(this.$route.params.id).then(response => this.bill  =  response.data);
            },
            updateBill(bill){
                BillService.updateBill(bill.id, bill).then(() => this.$router.push({name: "BillList"}));
            }
        },
        created(){
            this.fetchBill();
        }
    };
</script>