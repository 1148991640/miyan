import $axios from "@/common/http";

export async function getBanner() {
  let res = await $axios.get("/bannerlist");
  if (res.code == 200 && res.list) {
    return res.list;
  } else {
    return [];
  }
}

export function addBanner(data) {
  return $axios.post("/banneradd", data);
}

export function editBanner(data) {
  return $axios.post("/banneredit", data);
}

export function delBanner(id) {
  return $axios.post("/bannerdelete", { id });
}
