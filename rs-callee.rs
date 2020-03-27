pub struct Callee {
    value: i32,
}

impl Callee {
    pub extern fn PlusValue(&self, value: i32) -> i32 {
        return self.value + value;
    }
}
