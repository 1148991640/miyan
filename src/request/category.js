import $axios from "@/common/http"

export async function getCategory() {
  let res = await $axios.get("/catelist?istree=1")
  if (res.code == 200 && res.list) {
    return res.list
  } else {
    return []
  }
}

export function addCategory(data) {
  return $axios.post("/cateadd", data)
}

export function editCategory(data) {
  return $axios.post("/cateedit", data)
}

export function delCategory(id) {
  return $axios.post("/catedelete", { id })
}