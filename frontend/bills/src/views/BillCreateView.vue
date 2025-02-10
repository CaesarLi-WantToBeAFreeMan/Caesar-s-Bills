<template>
    <div>
        <h2 class = "titles">Create New Bill</h2>
        <BillForm @submit = "createBill"/>
    </div>
</template>

<script>
    import BillForm from "../components/BillForm.vue";
    import BillService from "../services/BillService";

    export default{
        components: {
            BillForm
        },
        methods: {
            createBill(bill){
                BillService.createBill(bill);
            }
        }
    };
</script>