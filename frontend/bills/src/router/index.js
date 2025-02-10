import {createRouter, createWebHistory} from "vue-router";
import BillListView from "../views/BillListView.vue";

    const routes = [
    {
        path: "/",
        name: "billList",
        component: BillListView
    },
    {
        path: "/create",
        name: "billCreate",
        component: () => import("../views/BillCreateView.vue")
    }
];

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
});

export default router;