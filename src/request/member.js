import $axios from "@/common/http";

export async function getMember() {
  let res = await $axios.get("/memberlist");
  if (res.code == 200 && res.list) {
    return res.list;
  } else {
    return [];
  }
}

export function editMember(data) {
  return $axios.post("/memberedit", data);
}
