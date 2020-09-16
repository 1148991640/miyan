import $axios from "@/common/http"

export async function getGoods(page = 1, size = 10) {

    let res = await $axios.get("/goodslist", {
        params: {
            size,
            page
        }
    })
    if (res.code == 200 && res.list) {
        return res.list
    } else {
        return []
    }
}

export function addGoods(data) {
    return $axios.post("/goodsadd", data)
}

export function editGoods(data) {
    return $axios.post("/goodsedit", data)
}

export function delGoods(id) {
    return $axios.post("/goodsdelete", { id })
}

export async function getTotal() {
    let res = await $axios.get("/goodscount")
    return res.list[0].tatal
}